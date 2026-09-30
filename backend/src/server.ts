import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import path from 'path';

dotenv.config();

const app = express();
const port = process.env.PORT || 3000;

app.use(cors());
app.use(express.json());

// Routes will be imported here
import unidadesRoutes from './routes/unidades';
import authRoutes from './routes/auth';
import faturamentoRoutes from './routes/faturamento';

app.use('/api/unidades', unidadesRoutes);
app.use('/api/auth', authRoutes);
app.use('/api/faturamento', faturamentoRoutes);

// Serve static frontend in production
app.use(express.static(path.join(__dirname, '../../frontend/dist')));

app.use((req, res, next) => {
  if (!req.path.startsWith('/api')) {
    res.sendFile(path.join(__dirname, '../../frontend/dist/index.html'));
  } else {
    next();
  }
});

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
